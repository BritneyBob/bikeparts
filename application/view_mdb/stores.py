from application.controllers.store_controller import view_stores


def view_all_stores():
    stores = view_stores()
    sorted_stores = sorted(stores, key=lambda x: x.address.city_name)

    for store in sorted_stores:

        print(f'\nAddress: {store.address.address_line2} {store.address.city_name}')
        print(f'Country: {store.address.country_name}')
        print(f'Store id: {store.store_id}')
        print('Employees working here:')
        for s in store.employees:
            print(f'\t{s.first_name} {s.last_name}, {s.email}')

