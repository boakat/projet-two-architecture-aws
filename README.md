# projet-two-architecture-aws

Terraform déploie une architecture à deux niveaux dans AWS .
Dans ce projet , nous plongerons dans Terraform et AWS .
Nous concevrons une architecture à 2 niveaux composée des elements suivants :
  - Un VPC avec 2 sous-réseaux publics et 2 sous-réseaux privés
  - Un équilibreur de charge qui dirigera le trafic vers les sous-réseaux publics et l'instance EC2 dans chaque sous-réseau public
  - Une instance MySQL RDS dans l'un des sous-réseaux 


Etape 1 : créer une ressource VPC personnalisée avec CIDR 10.0.0.0/16 . 

Etape 2 : créer une ressource passerelle Internet qui sera attacher au VPC .

Etape 3 : créer  2 sous-réseaux publics avec CIDR CIDR 10.0.1.0/24 et CIDR 10.0.2.0/24 .
         NB : Chaque sous-réseau se trouve dans une zone de disponibilité différente ;us-east-1a et us-east-1b 
         
Etape 4 : créer  2 sous-réseaux privés avec CIDR CIDR 10.0.3.0/24 et CIDR 10.0.4.0/24 .
         NB : les sous-réseaux publics mappent l'adresse IP publique au lancement alors que les sous-réseaux privées ne le font pas 

Etape 5 : Creer une table de routage pour acheminer le trafic via la passerelle Internet afin d'avoir un accès Internet au VPC

Etape 6 : Créer un sécurity group pour permettre l'accessibilite des sous-réseaux publics

Etape 7 : Créer un security group pour le sous-réseaux privés pour autoriser le SSH et HTTP
          le port 3306 pour la base de données 
        
Etape 8 : Créer une equilibreur de charge (load balancer) : Cependant nous avons besion de :

           - Groupe ciblé 
           
           - Ciblez les pièces jointes , vos instances EC2
           
           - Un ecouteur sur le port 80
           
 Etape 9 : Créer les instances EC2 qui seront lancées dans chaque sous-réseau public 
 
 Etape 10 : Créer une instance de base données RDS MYSQL  dans l'un des sous-réseaux de base de données privés
 
           NB: Pour ce faire ,nous devons ajouter un groupe de sous-réseaux de base de données et mettre nos 2 sous-réseaux privés 
       
  Etape 10 : Créer un autre fichier outputs.tf dans le répertoire principal ,pour indiquer quelles sorties nous voulons voir 
  
  
  Une fois tout terminé , vous pouvez vous connecter en ssh 
       
         ssh -A ec2-user@ip_adresse_aws_public
   
   NB : pour acceder a la base de donnees vous tapez : sudo yum install mariadb
   
        mysql -h db-instance.cm4bp7mgz27s.us-east-1.rds.amazonaws.com -P 3306 -u admin -p
 
         
