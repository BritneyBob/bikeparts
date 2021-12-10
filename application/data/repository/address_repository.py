from application.data.db import session
from application.data.models import Address


def create_address(address):
    address = Address(**address)
    session.add(address)
    session.commit()


def get_all_addresses():
    return session.query(Address).all()


def get_all_addresses_of_address_type(address_type_id):
    return session.query(Address).filter(Address.address_type_id == address_type_id).all()
