#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
main_menu() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "\n~~~~~ MY SALON ~~~~~\n"
    echo -e "Welcome to My Salon, how can I help you?\n"
  fi
  echo -e "1) Cuting\n2) Brushing\n3) Nails"
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1|2|3) customer ;;
    *) main_menu "I could not find that service. What would you like today?" ;;
  esac
}
customer() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';" | xargs)
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    $PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME');"
  fi
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED;" | xargs)

  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';" | xargs)
  $PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');"

  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}
main_menu
