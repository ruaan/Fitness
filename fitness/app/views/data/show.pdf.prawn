pdf.text "Order # 0001 ", :size => 30, :style => :bold
pdf.text "Sun International"
pdf.text "Boardwalk"

pdf.move_down(30)
pdf.text "-------------------------------------------------------------------------------------------------------------------------------"

  @sections.each do |section|
       pdf.text section.name
        for subsection in section.subsections
        if subsection.name == ""
        else
               pdf.text subsection.name
            pdf.text "-------------------------------------------------------------------------------------------------------------------------------"

          for product in subsection.products

            pdf.text product.title+"                         "+product.sku+"                         "+product.description+"                              "+product.price

           end
                end
                end
           end
pdf.text pdf.text "-------------------------------------------------------------------------------------------------------------------------------"
pdf.text "Subtotal                                                                                                                   R0.00"
pdf.text "Discount                                                                                                                  R0.00"
pdf.text "Delivery                                                                                                                   R0.00"
pdf.text "Vat 14%                                                                                                                   R0.00"
pdf.text pdf.text "-------------------------------------------------------------------------------------------------------------------------------"
pdf.text "Total                                                                                                                         R0.00"