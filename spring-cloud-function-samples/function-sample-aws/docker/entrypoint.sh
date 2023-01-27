#!/bin/sh

java_binary="/usr/bin/java"
jvm_args="\
--class-path /var/runtime/lib/*:/var/task/lib/*:/var/task/ \
--add-opens java.base/java.util=ALL-UNNAMED \
com.amazonaws.services.lambda.runtime.api.client.AWSLambda \
org.springframework.cloud.function.adapter.aws.FunctionInvoker\
"

if [ -z "${AWS_LAMBDA_RUNTIME_API}" ]; then
  # When AWS_LAMBDA_RUNTIME_API isn't set, we're running locally.
  exec /usr/bin/aws-lambda-rie $java_binary $jvm_args
else
  exec $java_binary $jvm_args
fi
