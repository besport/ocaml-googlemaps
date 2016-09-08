NAME=googlemaps
PACKAGE=-package gen_js_api,js_of_ocaml
all:
	ocamlfind gen_js_api/gen_js_api $(NAME).mli
	ocamlfind ocamlc -c $(PACKAGE) converter.ml $(NAME).mli
	ocamlfind ocamlc -c -package gen_js_api.ppx $(PACKAGE) converter.ml $(NAME).ml
	ocamlfind ocamlc -a -package gen_js_api.ppx -o $(NAME).cma $(NAME).cmo
	ocamlfind ocamlc -a -package gen_js_api.ppx -o converter.cma converter.cmo

install: all
	ocamlfind install ocaml-googlemaps META *.cma *.cmi

mrproper:
	rm -rf maps *.cmi *.cmo *.cma

clean:
	rm -rf $(NAME) $(NAME).ml *.cmi *.cmo *.cma
