# Pretty cURL

Using pretty-printed `curl` outputs is useful for many different purposes ranging from dev testing all the way to customer demos. This script aims to provide the tools necessary to achieve just that.

## Installation

In order to make this setup work, you will need to install the following tools (given you already have cURL installed):
* `npm`
* `python-setuptools`
* `xml-twig-tools`
* `json`
* `pygments`

### Installation on Ubuntu

```bash
sudo apt-get update && apt-get install -y \
    npm \
    python-setuptools \
    xml-twig-tools

npm install -g json
easy_install pygments
```

### Installation on Fedora

```bash
su -
dnf install xml-twig-tools
dnf install perl-HTML-Tree-1:5.03-11.fc23.noarch
dnf install perl-IO-stringy-2.111-3.fc23.noarch
dnf install perl-XML-Parser-2.44-3.fc23.x86_64
dnf install python-setuptools-18.0.1-2.fc23.noarch

npm install -g json
easy_install pygments
```

## Custom functions

To save some additional typing, you can utilize bash functions. Just add the following lines into your `.bashrc` or `.zshrc`.

```bash
function jcurl() {
    curl "$@" | json_pp | pygmentize -l json
}

export jcurl

function xcurl() {
    curl "$@" | xml_pp | pygmentize -l xml
}

export xcurl
```

## How to use it?

### JSON example - jcurl

Running following command

```
jcurl -gX GET http://localhost:8080/Spring4WithSwagger/rest/api-docs/
```

producs an output like this:

![pretty-curl-json-demo][pretty-curl-json-demo]

### JSON example - xcurl

Running following command

```
xcurl -gX GET http://localhost:8080/Spring4WithSwagger/rest/products/
```

producs an output like this:

![pretty-curl-xml-demo][pretty-curl-xml-demo]

## Docker

I also created a docker image to make the setup even easier. The image is always built automatically from `master` branch on each new commit/push. To learn more just follow the link to Docker Hub.

[![docker-image][docker-image]](https://hub.docker.com/r/jakubstas/pretty-curl/)

[pretty-curl-json-demo]: http://jakubstas.com/wp-content/uploads/2016/07/pretty-curl-json.png "Pretty curl JSON demo"
[pretty-curl-xml-demo]: http://jakubstas.com/wp-content/uploads/2016/07/pretty-curl-xml.png "Pretty curl XML demo"
[docker-image]: http://jakubstas.com/wp-content/uploads/2016/07/docker-small.png "Docker image jakubstas/prettu-curl"
