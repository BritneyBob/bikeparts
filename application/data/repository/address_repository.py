from application.data.db import session
from application.data.models import Address


def create_address(address):
    address = Address(**address)
    session.add(address)
    session.commit()
