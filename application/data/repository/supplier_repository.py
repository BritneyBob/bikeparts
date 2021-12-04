from application.data.db import session
from application.data.models import Supplier, SparePart, Company, SparePartSupplier


def create_supplier(supplier):
    supplier = Supplier(**supplier)
    session.add(supplier)
    session.commit()


def get_suppliers():
    suppliers = session.query(Supplier).all()
    return suppliers


def show_products_from_company(_id):
    products = session.query(
        SparePart
    ).join(
        SparePartSupplier
    ).join(
        Supplier
    ).join(
        Company
    ).filter(
        Supplier.supplier_id == _id
    ).all(
    )
    print()
    name_and_id = []
    for product in products:
        name_and_id.append(f'Product id: {product.product_number}, Product name: {product.name}')
    return name_and_id

#
#  t1 = aliased(Task)
#  t2 = aliased(Task)
#  query = (
#  self.db.query(t2)
#  .select_from(t1)
#  .join(t2, t2.g_id == t1.g_id)
#  .filter(t1.id == task_id)
# )


#     SELECT spare_parts.product_number, name, description, c.company_name
# FROM spare_parts
# INNER JOIN spare_parts_have_suppliers sphs on spare_parts.product_number = sphs.product_number
# INNER JOIN suppliers s on sphs.supplier_id = s.supplier_id
# INNER JOIN companies c on s.company_id = c.company_id
# WHERE s.supplier_id = 51;


