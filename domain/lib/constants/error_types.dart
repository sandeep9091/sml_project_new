enum ErrorType {
  IOEXCEPTION,
  UI,

  ///Network Error
  NETWORK,
  NET_SERVER_MESSAGE,
  UNAUTHORIZED_USER,
  NET_NO_INTERNET_CONNECTION,
  INVALID_BENEFICIARY,

  ///DB ERROR
  DATABASE,
  DATABASE_NOT_SUPPORTED,
  DB_ERROR1,
  DB_USER_NOT_FOUND,
}
