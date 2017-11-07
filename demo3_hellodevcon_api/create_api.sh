#!/bin/sh

echo Using account $ACCOUNT_ID and role $API_GW_ROLE_ARN

echo -------------
echo Create api
REST_API_ID=$(aws apigateway create-rest-api --name 'Hello Devcon Api' | jq -r '.id' )
ROOT_RESOURCE_ID=$(aws apigateway get-resources --rest-api-id $REST_API_ID | jq -r '.items[0].id')

echo -------------
echo Create proxy resource
RESOURCE_ID=$(aws apigateway create-resource --rest-api-id $REST_API_ID --parent-id $ROOT_RESOURCE_ID --path-part '{hello+}' | jq -r '.id')

echo -------------
echo Create integration
aws apigateway put-method --rest-api-id $REST_API_ID --resource-id $RESOURCE_ID --http-method ANY --authorization-type NONE \
&& aws apigateway put-integration --rest-api-id $REST_API_ID --resource-id $RESOURCE_ID --http-method ANY --type AWS_PROXY --integration-http-method POST --uri arn:aws:apigateway:eu-west-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-west-1:${ACCOUNT_ID}:function:HelloDevconApi/invocations --credentials $API_GW_ROLE_ARN \
&& aws apigateway create-deployment --rest-api-id $REST_API_ID --stage-name test

echo API id: $REST_API_ID
echo Proxy resource id: $RESOURCE_ID
echo -------------
echo Test is with:
echo http https://${REST_API_ID}.execute-api.eu-west-1.amazonaws.com/test/hello
