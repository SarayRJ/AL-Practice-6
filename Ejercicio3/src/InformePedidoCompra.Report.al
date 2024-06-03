report 70845 ReportPersonaliced
{
    Caption = 'Pedido compra';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = PersonalizedPurchaseReport;
    PreviewMode = PrintLayout;
    WordMergeDataItem = "Purchase Header";



    dataset
    {
        //Agregamos elementos de datos(tabla). Las tablas que lee el informe
        dataitem("Purchase Header"; "Purchase Header")
        {//Es la clave por la que se va a ordenar, elc riterio de ordenación que vamos a utilizar y los filtros del elemento de datos(Utilizamos las pk)
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const("Order"));
            RequestFilterFields = "No.", "Buy-from Vendor No.", "No. Printed";
            RequestFilterHeading = 'Standard Purchase - Order';
            PrintOnlyIfDetail = true;


            //Columnas (campos tabla, variables, etc..)

            //No. de pedido
            column(NoPedido; "Posting Description")
            {

            }
            //Fecha de la compra
            column(FechaCompra; "Posting Date")
            {

            }

            //Fecha recepción pedido
            column(FechaRecepcion; "Expected Receipt Date")
            {

            }
            //Nombre del comprador
            column(NombreCliente; "Pay-to Name")
            {

            }
            //Dirección del comprador
            column(DireccionCliente; "Buy-from Address")
            {

            }
            //Telefono del comprador
            column(TelefonoCLiente; RecVendor."Phone No.")
            {

            }
            //Email del comprador


            //CIF del comprador
            column(CIFCliente; "VAT Registration No.")

            {

            }

            //No. factura proveedor
            column(NumeroFactura; "Vendor Invoice No.")
            {

            }

            //Condiciones de pago
            column(CondicionesPago; "Payment Terms Code")
            {

            }
            //Condiciones de envio
            column(CondicionesEnvio; "Shipment Method Code")
            {

            }


            //Logo de la empresa
            column(LogoEmpresa; InfoEmpresa.Picture)
            {

            }
            //Nombre de la empresa
            column(NombreEmpresa; InfoEmpresa.Name)
            {

            }
            //Dirección de la empresa
            column(DireccionEmpresa; InfoEmpresa.Address)
            {

            }

            //Telefono de la empresa
            column(TelefonoEmpresa; InfoEmpresa."Phone No.")
            {

            }
            //Email de la empresa
            column(EmailEmpresa; InfoEmpresa."E-Mail")
            {

            }
            //CIF de la empresa
            column(CIFEmpresa; InfoEmpresa."VAT Registration No.")
            {

            }
            column(ImporteTotal; "Amount Including VAT")
            {

            }



            //purchase line
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLinkReference = "Purchase Header";
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                DataItemTableView = sorting("Document Type", "Document No.", "Line No.");


                //No
                column(NumeroPedido; "No.")
                {

                }
                //Descripción
                column(DescripcionPedidoM; "Description")
                {

                }

                //cantidad
                column(CantidadProducto; "Quantity")
                {

                }
                //Unidad
                column(UnidadDeProducto; "Unit of Measure Code")
                {

                }
                //Coste unitario directo
                column(CosteUnitarioDirecto; "Direct Unit Cost")
                {

                }
                //%IVA
                column(PorcentajeIVA; "VAT %")
                {

                }

                /* trigger OnAfterGetRecord()
                 begin
                     AllowInvDisctxt := Format("Allow Invoice Disc.");
                     TotalSubTotal += "Line Amount";
                     TotalInvoiceDiscountAmount -= "Inv. Discount Amount";
                     TotalAmount += Amount;

                     ItemNo := "No.";

                     if "Vendor Item No." <> '' then
                         ItemNo := "Vendor Item No.";

                     if "Item Reference No." <> '' then
                         ItemNo := "Item Reference No.";

                     //  FormatDocument.SetPurchaseLine("Purchase Line", FormattedQuanitity, FormattedDirectUnitCost, FormattedVATPct, FormattedLineAmount);
                 end;*/

            }
        }
    }
    /*
        requestpage
        {
            AboutTitle = 'Teaching tip title';
            AboutText = 'Teaching tip content';
            layout
            {
                area(Content)
                {
                    group(GroupName)
                    {
                        field(Name; SourceExpression)
                        {
                            ApplicationArea = All;

                        }
                    }
                }
            }

            actions
            {
                area(processing)
                {
                    action(LayoutName)
                    {
                        ApplicationArea = All;

                    }
                }
            }


        }*/
    rendering
    {
        layout("PersonalizedPurchaseReport")
        {
            Type = RDLC;
            LayoutFile = './src/PersonalizedPurchaseReport .rdl';
            Caption = 'Informe personalizado de pedidos de compras.';
        }
    }
    trigger OnInitReport()
    var
        IsHandled: Boolean;
    begin

        InfoEmpresa.Get();
        InfoEmpresa.CalcFields(Picture);

        //que no me coja las lineas que estan vacias.
        /*IsHandled := false;

#if not CLEAN23
        if not IsHandled then begin
            LegalOfficeTxt := InfoEmpresa.GetLegalOffice();
            LegalOfficeLbl := InfoEmpresa.GetLegalOfficeLbl();
            CustomGiroTxt := InfoEmpresa.GetCustomGiro();
            CustomGiroLbl := InfoEmpresa.GetCustomGiroLbl();
        end;*/

    end;

    var
        InfoEmpresa: Record "Company Information";
        RecVendor: Record Vendor;

    //No. de pedido
    //Fecha de la compra
    //Nombre del comprador
    //Dirección del comprador
    //Telefono del comprador
    //Email del comprador 
    //CIF del comprador

    //Condiciones de pago
    //Condiciones de envio
    //No. factura

    //Logo de la empresa
    //Nombre de la empresa
    //Dirección de la empresa
    //Telefono de la empresa
    //Email de la empresa
    //CIF de la empresa


}