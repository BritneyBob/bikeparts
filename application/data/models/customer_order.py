from sqlalchemy import Integer, Column, ForeignKey, DateTime, Date, String, Text
from sqlalchemy.orm import relationship

from application.data.db import Base

from application.data.models.order_detail import OrderDetail


class CustomerOrder(Base):
    __tablename__ = "customer_orders"
    customer_order_number = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    customer_id = Column(Integer, ForeignKey('customers.customer_id'), nullable=False)
    store_id = Column(Integer, ForeignKey('stores.store_id'), nullable=False)
    employee_id = Column(Integer, ForeignKey('employees.employee_id'), nullable=False)
    order_date = Column(DateTime, nullable=False)
    shipped_date = Column(Date)
    status = Column(String(45), nullable=False)
    comments = Column(Text)
    spare_parts = relationship("OrderDetail", back_populates="customer_orders")
    # TODO: Add relation to customers
    # TODO: Add relation to stores
    # TODO: Add relation to employees
