FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:alpine
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
