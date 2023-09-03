# HELM version : >= helm-3.2

That's complete solution to deploy application into kubernetes and which can be used inside cicd tools like Jenkins or something like that.

**Here is to deploy with real world variable**

    helm install redis --namespace redis \
        --create-namespace -f ./values/dev.yaml \
        -set namespace=redis \
        ./
