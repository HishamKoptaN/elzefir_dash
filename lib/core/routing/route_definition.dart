enum AppPermission {
  orders('orders'),
  invoices('invoices'),
  paymentVouchers('payment_vouchers'),
  receiptVouchers('receipt_vouchers'),
  users('users'),
  roles('roles'),
  settings('settings');

  final String value;
  const AppPermission(this.value);
}
