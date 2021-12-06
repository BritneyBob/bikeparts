from application.controllers.supplier_controller import get_suppliers, negotiation  # , show_products_from_company


def negotiate_supplier_prices():
    id_and_buy_price = []
    comp_and_supp_id = {'company_id': 0, 'supplier_id': 0}
    print('List of our suppliers:')
    suppliers = get_suppliers()
    for supplier in suppliers:
        print(f'Company id: {supplier.company_id}, Company name: {supplier.company.company_name}')

    _id = int(input('Please choose the company id for the company you want to negotiate with: '))  # Validate company_id
    comp_and_supp_id['company_id'] = _id
    for supplier in suppliers:
        if supplier.company_id == _id:
            company_name = supplier.company.company_name
            comp_and_supp_id['supplier_id'] = supplier.supplier_id
            print(f'\nThese are the products that the company {company_name} sells to you: ')
            for spare_part in supplier.spare_parts:
                print(f'Product id: {spare_part.product_number}, Product name: {spare_part.spare_part.name}, '
                      f'Current buy price: {spare_part.buy_price}')
                id_and_buy_price.append({'product_number: ': spare_part.product_number,
                                         'name: ': spare_part.spare_part.name, 'buy_price: ': spare_part.buy_price})
            break

    new_buy_prices = negotiation(id_and_buy_price, comp_and_supp_id)
    print('List with updated prices:')
    for i in range(len(id_and_buy_price)):
        print(f"Product id: {id_and_buy_price[i]['product_number: ']}, Product name: {id_and_buy_price[i]['name: ']}, "
              f"New buy price: {new_buy_prices[i]}")




    pass
