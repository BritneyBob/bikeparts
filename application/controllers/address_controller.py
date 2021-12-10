from application.data.repository import address_repository


def create_address(address):
    address_repository.create_address(address)


def get_all_addresses():
    return address_repository.get_all_addresses()


def get_all_addresses_of_address_type(address_type_id):
    return address_repository.get_all_addresses_of_address_type(address_type_id)
