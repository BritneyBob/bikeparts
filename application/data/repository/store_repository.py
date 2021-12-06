from application.data.db import session
from application.data.models import Store, Address, AddressType


def create_store(store):
    store = Store(**store)
    session.add(store)
    session.commit()


def view_stores():
    return session.query(Store).join(Address).join(AddressType).filter(AddressType.address_type_id == 3).all()

