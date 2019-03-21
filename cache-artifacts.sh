#!/usr/bin/env bash

# Artifacts that are not in brew:

# jboss-bpmsuite-6.4.11.GA-deployable-eap6.x.zip        | http://download.devel.redhat.com/devel/candidates/BPMS/BPMS-6.4.11.CR2/jboss-bpmsuite-6.4.11.GA-deployable-eap6.x.zip
# jboss-brms-bpmsuite-6.4.11.GA-supplementary-tools.zip | http://download.devel.redhat.com/devel/candidates/BPMS/BPMS-6.4.11.CR2/jboss-brms-bpmsuite-6.4.11.GA-supplementary-tools.zip
# jboss-bxms-6.4.11-RHBPMS-5222.zip                     | https://access.redhat.com/hydra/rest/cases/02231548/attachments/737556fd-9ab8-4960-9c71-cc9ae45f6401

# jboss-eap-6.4.0.zip                                   | https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=37393
# jboss-eap-6.4.9-patch.zip                             | https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=45371
# jboss-eap-6.4.19-patch.zip                            | https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=56031
# jboss-eap-6.4.21-patch.zip                            | https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=61821

# rh-sso-7.2.2-eap6-adapter.zip                         | https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=57851&product=core.service.rhsso
# rh-sso-7.2.2-saml-eap6-adapter.zip                    | https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=57811&product=core.service.rhsso

# javax.json-1.0.4.jar                                  | http://central.maven.org/maven2/org/glassfish/javax.json/1.0.4/javax.json-1.0.4.jar

D="${1:-.}"
for Z in \
    jboss-bpmsuite-6.4.11.GA-deployable-eap6.x.zip \
    jboss-brms-bpmsuite-6.4.11.GA-supplementary-tools.zip \
    jboss-bxms-6.4.11-RHBPMS-5222.zip \
    jboss-eap-6.4.0.zip \
    jboss-eap-6.4.9-patch.zip \
    jboss-eap-6.4.19-patch.zip \
    jboss-eap-6.4.21-patch.zip \
    rh-sso-7.2.2-eap6-adapter.zip \
    rh-sso-7.2.2-saml-eap6-adapter.zip \
    javax.json-1.0.4.jar \
; do
    F="${D}/${Z}"
    if [ -e "${F}" ] ; then
        sha256=$(sha256sum "${F}" | awk '{ print $1 }')
        sha1=$(sha1sum "${F}" | awk '{ print $1 }')
        md5=$(md5sum "${F}" | awk '{ print $1 }')
        cekit-cache add "${F}" --sha256 ${sha256} --sha1 ${sha1} --md5 ${md5}
    else
        echo "can't cache "${F}" - file missing"
    fi
done
