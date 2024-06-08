#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ SALON ~~~~~\n"
echo Welcome to My Salon, how can I help you?
MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo -e "\n1) Corte de pelo\n2) Pintado de pelo \n3) Peinado"
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1)  CORTE ;;
    2)  PINTADO ;;
    3)  PEINADO ;;
    *) MAIN_MENU "Please enter a valid option." ;;
  esac
}
CORTE()
{
  #get customer info
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE';")
      #if customer doesn't exist 
        if [[ -z $CUSTOMER_NAME ]]
        then
          # get new customer name
          echo -e "\nWhat's your name?"
          read CUSTOMER_NAME
          # insert new customer
          INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
          echo -e "\nWhat time would you like your cut, Fabio?"
          read SERVICE_TIME
          #get customer_id
          CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone = '$CUSTOMER_PHONE';")
          INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) values('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME');")
          #get service name
          SERVICE_NAME=$($PSQL "SELECT name FROM services where service_id = '$SERVICE_ID_SELECTED';")
          echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
        else
        echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
        read SERVICE_TIME
        #get customer_id
          CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone = '$CUSTOMER_PHONE';")
          INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) values('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME');")
          #get service name
          SERVICE_NAME=$($PSQL "SELECT name FROM services where service_id = '$SERVICE_ID_SELECTED';")
          echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
        fi
}
PINTADO() {
  #get customer info
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE';")
      #if customer doesn't exist 
        if [[ -z $CUSTOMER_NAME ]]
        then
          # get new customer name
          echo -e "\nWhat's your name?"
          read CUSTOMER_NAME
          # insert new customer
          INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
          echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
          read SERVICE_TIME
          #get customer_id
          CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone = '$CUSTOMER_PHONE';")
          INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) values('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME');")
          #get service name
          SERVICE_NAME=$($PSQL "SELECT name FROM services where service_id = '$SERVICE_ID_SELECTED';")
          echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, '$CUSTOMER_NAME'."
        else
        echo -e "\nWhat time would you like your dye, '$CUSTOMER_NAME'?"
        read SERVICE_TIME
        #get customer_id
          CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone = '$CUSTOMER_PHONE';")
          INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) values('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME');")
          #get service name
          SERVICE_NAME=$($PSQL "SELECT name FROM services where service_id = '$SERVICE_ID_SELECTED';")
          echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, '$CUSTOMER_NAME'."
        fi
}
PEINADO() {
#get customer info
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE';")
      #if customer doesn't exist 
        if [[ -z $CUSTOMER_NAME ]]
        then
          # get new customer name
          echo -e "\nWhat's your name?"
          read C
          # insert new customer
          INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
          echo -e "\nWhat time would you like your peinado, Fabio?"
          read SERVICE_TIME
          #get customer_id
          CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone = '$CUSTOMER_PHONE';")
          INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) values('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME');")
          #get service name
          SERVICE_NAME=$($PSQL "SELECT name FROM services where service_id = '$SERVICE_ID_SELECTED';")
          echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, '$CUSTOMER_NAME'."
        else
        echo -e "\nWhat time would you like your peinado, '$CUSTOMER_NAME'?"
        read SERVICE_TIME
        #get customer_id
          CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone = '$CUSTOMER_PHONE';")
          INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) values('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME');")
          #get service name
          SERVICE_NAME=$($PSQL "SELECT name FROM services where service_id = '$SERVICE_ID_SELECTED';")
          echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, '$CUSTOMER_NAME'."
        fi
}

EXIT() {
  echo -e "\nThank you for stopping in.\n"
}
MAIN_MENU
EXIT