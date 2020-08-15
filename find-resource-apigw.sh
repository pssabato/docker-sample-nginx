#!/bin/bash

RES_ID_TO_FIND='<your-res-id>'
REGION='<your-region>'

arr=$(aws apigateway --region=$REGION get-rest-apis --query 'items[*].id' --output text | tr '\t' ' ')

for API_ID in $arr; do

  echo -e "\n\n"
  echo -e "Checking API: "$API_ID
  out=$(aws apigateway --region=$REGION get-resource --rest-api-id $API_ID --resource-id $RES_ID_TO_FIND)
  echo $out

done
