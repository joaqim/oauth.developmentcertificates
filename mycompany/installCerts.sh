#
# Ensure that we are in the folder containing this script
#
cd "$(dirname "${BASH_SOURCE[0]}")"

#
# Point to the OpenSSL configuration file for the platform
#
case "$(uname -s)" in

  # Mac OS
  Darwin)
    exit 1
 	;;

  # Windows with Git Bash
  MINGW64*)
    exit 1
	;;
  # Linux
  Linux)
    PLATFORM="LINUX"
	;;

esac

#
# Root certificate parameters
#
ORGANIZATION='mycompany'
ROOT_CERT_FILE_PREFIX="$ORGANIZATION.ca"
ROOT_CERT_DESCRIPTION="Self Signed CA for $ORGANIZATION.com"

#
# SSL certificate parameters
#
SSL_CERT_FILE_PREFIX="$ORGANIZATION.ssl"
SSL_CERT_PASSWORD='Password1'
WILDCARD_DOMAIN_NAME="*.$ORGANIZATION.com"

sudo cp "$ROOT_CERT_FILE_PREFIX.pem" "/etc/ca-certificates/trust-source/anchors/$ROOT_CERT_FILE_PREFIX.crt"
sudo cp "$SSL_CERT_FILE_PREFIX.pem" "/etc/ca-certificates/trust-source/anchors/$SSL_CERT_FILE_PREFIX.crt"
sudo update-ca-trust
