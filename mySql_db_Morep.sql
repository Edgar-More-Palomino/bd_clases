CREATE DATABASE IF NOT EXISTS  db_Morep;
use db_Morep;
CREATE TABLE profiles (
  id INT NOT NULL AUTO_INCREMENT,
  description VARCHAR(45) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE collaborators (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  lastname VARCHAR(45) NOT NULL,
  dni CHAR(8) NOT NULL,
  user VARCHAR(45) NOT NULL,
  password VARCHAR(45) NOT NULL,
  profil_Id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_profiles FOREIGN KEY (id) REFERENCES  profiles(id)
  )
  ENGINE = InnoDB;
  
  CREATE TABLE servicesTypes (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE clients (
  id INT NOT NULL AUTO_INCREMENT,
  ruc VARCHAR(45) NOT NULL,
  businessName VARCHAR(45) NOT NULL,
  phone INT NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE purchaseOrders (
  id INT NOT NULL AUTO_INCREMENT,
  quote_Id INT NOT NULL,
  number_  INT NOT NULL,
  broadcast_Date DATE NOT NULL,
  clients_Id INT NOT NULL,
  billing_types VARCHAR(45) NOT NULL,
  billing_dates DATE NOT NULL,
  due_payment_date DATE NOT NULL,
  pay_Day INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_clients FOREIGN KEY (clients_Id) REFERENCES clients (id)
  )
  ENGINE = InnoDB;
  
  CREATE TABLE services (
  id INT NOT NULL AUTO_INCREMENT,
  order_buy_id INT NOT NULL,
  id_servicesTypes INT NOT NULL,
  detailed_idization_id INT NOT NULL,
  priority VARCHAR(45) NOT NULL,
  state VARCHAR(45) NOT NULL,
  deliver_date DATE NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_purchaseOrders FOREIGN KEY (order_buy_id) REFERENCES purchaseOrders (id),
  CONSTRAINT fk_servicesTypes FOREIGN KEY (id_servicesTypes) REFERENCES servicesTypes (id)
  
    )
   ENGINE = InnoDB;
   
   CREATE TABLE servicesAssignment (
  services_id INT NOT NULL,
  collaborators_id INT NOT NULL,
  CONSTRAINT fk_services FOREIGN KEY (services_id) REFERENCES services (id),
  CONSTRAINT fk_collaborators FOREIGN KEY (collaborators_id) REFERENCES collaborators (id)
    )
ENGINE = InnoDB;


  CREATE TABLE quotations (
  id INT NOT NULL AUTO_INCREMENT,
  number INT NOT NULL,
  broadcast_Date DATE NOT NULL,
  clients_Id INT NOT NULL,
  state VARCHAR(45) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_Cl FOREIGN KEY (clients_Id) REFERENCES clients (id)
  )
  ENGINE = InnoDB;
  
  CREATE TABLE quotationsDetail (
  id INT NOT NULL AUTO_INCREMENT,
  quote_Id INT NOT NULL,
  services VARCHAR(45) NOT NULL,
  id_servicesTypes INT NOT NULL,
  precio DECIMAL(18,2) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_quotations FOREIGN KEY (quote_Id) REFERENCES quotations (id),
  CONSTRAINT fk_services_ty FOREIGN KEY (id_servicesTypes) REFERENCES servicesTypes (id)
    )
  ENGINE = InnoDB;
  
  CREATE TABLE documents (
  id INT NOT NULL AUTO_INCREMENT,
  description VARCHAR(45) NOT NULL,
  clients_Id INT NOT NULL,
  id_servicesTypes INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_services_t FOREIGN KEY (id_servicesTypes) REFERENCES servicesTypes (id),
  CONSTRAINT fk_Clien FOREIGN KEY (clients_Id) REFERENCES clients (id)
  )
ENGINE = InnoDB;

CREATE TABLE documentsDetail (
  id INT NOT NULL AUTO_INCREMENT,
  documents_id INT NOT NULL,
  file_name VARCHAR(45) NOT NULL,
  upload_date DATE NOT NULL,
  version VARCHAR(45) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_documents FOREIGN KEY (documents_id) REFERENCES documents (id)
  )
ENGINE = InnoDB;
