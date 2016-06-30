NAME=maps
all:
	ocamlfind gen_js_api/gen_js_api $(NAME).mli
	ocamlfind ocamlc -package gen_js_api,js_of_ocaml $(NAME).mli
	ocamlfind ocamlc -c -package gen_js_api.ppx $(NAME).ml
	ocamlfind ocamlc -a -package gen_js_api.ppx -o $(NAME).cma $(NAME).cmo

install: all
	ocamlfind install ocaml-googlemap META *.cma *.cmi

mrproper:
	rm -rf maps *.cmi *.cmo *.cma

clean:
	rm -rf $(NAME) $(NAME).ml $(NAME).cmi $(NAME).cmo
