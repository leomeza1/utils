### Pop!_OS 22.04 LTS
BARRIER_SSL_PATH=~/.local/share/barrier/SSL/
BARRIER_SSL_PEM="${BARRIER_SSL_PATH}/Barrier.pem"

if [ ! -d "${BARRIER_SSL_PATH}" ]; then
  echo "${BARRIER_SSL_PATH} does NOT exist, make sure you've installed barrier!"
  exit 1
fi

if [ -f "${BARRIER_SSL_PEM}" ]; then
  echo "${BARRIER_SSL_PEM} already exists, exiting without doing anything!"
  exit 1
fi

echo "Creating SSL keys now..."

openssl req -x509 -nodes -days 365 -subj /CN=Barrier -newkey rsa:4096 -keyout ${BARRIER_SSL_PEM} -out ${BARRIER_SSL_PEM}

if [ $? -eq 0 ]; then
  echo "Command succeeded!"
else
  echo "Command failed, time to investigate."
fi

exit 0

