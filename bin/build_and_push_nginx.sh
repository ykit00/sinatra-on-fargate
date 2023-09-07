#!/bin/bash
awsProfile=personal
accountId=$(aws sts get-caller-identity --profile $awsProfile | jq -r '.Account')
region=ap-northeast-1
repository=$accountId.dkr.ecr.$region.amazonaws.com
imageTag=$repository/sinatra-on-fargate/nginx:latest
platform=linux/X86_64

echo Build tag: $imageTag

docker build --platform $platform -f docker/nginx/Dockerfile -t $imageTag .

aws --profile $awsProfile ecr get-login-password | docker login --username AWS --password-stdin $accountId.dkr.ecr.ap-northeast-1.amazonaws.com
docker push $imageTag
