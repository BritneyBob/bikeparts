from application.controllersMDB.store_controller import get_stores


def view_all_stores():
    for store in get_stores():
        print(f'\nAddress: {store.street_address}, {store.zipcode} {store.city}')
        print(f'Country: {store.country}')
        print(f'Store id: {store._id}')
        print(f'Store number: {store.store_number}')
        print('Employees working here:')
        for e in store.employees:
            print(f"\t{e['name']}, {e['email']}")

