# Latest images are here: https://gallery.ecr.aws/aleph0io/lambda/java
FROM public.ecr.aws/aleph0io/lambda/java@sha256:177ef86474d89f043cfda488b3b54c532ada7707940a8134a408e52370beeb81

# Add lambda runtime interface emulator
ADD https://github.com/aws/aws-lambda-runtime-interface-emulator/releases/download/v1.10/aws-lambda-rie /usr/bin/aws-lambda-rie
RUN chmod 555 /usr/bin/aws-lambda-rie

# Copy in application jar
COPY build/libs/*-aws.jar ${LAMBDA_TASK_ROOT}/lib/

# Copy in custom entrypoint
COPY docker/entrypoint.sh /
RUN chmod 555 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
