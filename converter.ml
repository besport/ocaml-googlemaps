open Js_of_ocaml

module Element = struct

  type t = Dom_html.element Js.t

  let t_to_js : t -> Ojs.t = Obj.magic

  let t_of_js : Ojs.t -> t = Obj.magic

  let t_of_dom : Dom_html.element Js.t -> t = fun x -> x

end

module Date = struct

  type t = Js.date Js.t

  let t_to_js : t -> Ojs.t = Obj.magic

  let t_of_js : Ojs.t -> t = Obj.magic

  let t_of_date : Js.date Js.t -> t = fun x -> x

end
