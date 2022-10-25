#!/bin/bash

echo "Criando imagens"

docker build -t natassjalessa/projeto-backend:1.0 backend/.
docker build -t natassjalessa/projeto-database:1.0 database/.

echo "Realizando push das imagens"

docker push natassjalessa/projeto-backend:1.0
docker push natassjalessa/projeto-database:1.0

echo "Criando servicos no cluster kubernetes"

kubectl apply -f ./services.yml

echo "Criando os deployments"

kubectl apply -f ./deployment.yml