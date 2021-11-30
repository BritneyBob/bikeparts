from sqlalchemy import Integer, Column, Date, Numeric, ForeignKey

from application.data.db import Base


class AutoOrder(Base):
    __tablename__ = "auto_orders"

    order_id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    product_number = Column(Integer, ForeignKey('spare_parts.product_number'), nullable=False)
    store_id = Column(Integer, ForeignKey('stores.store_id'), nullable=False)
    supplier_id = Column(Integer, ForeignKey('suppliers.supplier_id'), nullable=False)
    arrival_date = Column(Date)
    ordered_quantity = Column(Integer, nullable=False)
    price_each = Column(Numeric, nullable=False)
    # TODO: Add relation to suppliers
    # TODO: Add relation to spare_parts_in_stores
