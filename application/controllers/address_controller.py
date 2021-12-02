from application.data.repository import address_repository


def create_address(address):
    address_repository.create_address(address)
