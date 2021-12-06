from application.data.repository import store_repository


def create_store(store):
    store_repository.create_store(store)


def view_stores():
    return store_repository.view_stores()
