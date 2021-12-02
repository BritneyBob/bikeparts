from application.data.db import session
from application.data.models import Store


def create_store(store):
    store = Store(**store)
    session.add(store)
    session.commit()
