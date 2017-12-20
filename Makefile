.PHONY: css html css_inline

NODE_SASS=./node_modules/.bin/node-sass
PUG=./node_modules/.bin/pug
JUICE=./node_modules/.bin/juice

css:
	$(NODE_SASS) -r ./assets/sass -o ./public/_css --output-style compressed

css_inline:
	#$(JUICE) ./public/blank.html ./public/blank-inlined.html
	#$(JUICE) ./public/master.html ./public/master-inlined.html
	$(JUICE) ./public/hybrid-submission-confirmation.html ./public/hybrid-submission-confirmation-inlined.html
	$(JUICE) ./public/hybrid-payment-request.html ./public/hybrid-payment-request-inlined.html
	$(JUICE) ./public/hybrid-payment-confirmation.html ./public/hybrid-payment-confirmation-inlined.html

html:
	$(PUG) ./assets/html -P -o ./public

images:
	@mkdir -p ./public/images
	@cp -r ./assets/images ./public

build: images css html css_inline
