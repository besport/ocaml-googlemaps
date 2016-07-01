PACKAGES=-package js_of_ocaml,gen_js_api,ocaml-googlemap
OUT=byte.out
JS=example.js

all:
	ocamlfind ocamlc -o $(OUT) -no-check-prims $(PACKAGES) -linkpkg example.ml
	js_of_ocaml -o $(JS) +gen_js_api/ojs_runtime.js $(OUT)

clean:
	rm -rf *.cmi *.cmo $(OUT)
