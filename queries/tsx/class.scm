;; ============================================
;; JSX АТРИБУТЫ
;; ============================================

(jsx_attribute
  (property_identifier) @_attribute_name
  (#any-of? @_attribute_name "class" "className" "style" "css" "tw")
  [
    (string (string_fragment) @tailwind)
    (jsx_expression (template_string) @tailwind.inner)
  ])

;; ============================================
;; CVA() И ДРУГИЕ ФУНКЦИИ
;; ============================================

;; Универсальный паттерн для: cva, cn, clsx, twMerge
(call_expression
  function: (identifier) @_function_name
  (#any-of? @_function_name "cva" "cn" "clsx" "twMerge")
  arguments: (arguments
    [
      (string (string_fragment) @tailwind)
      (template_string) @tailwind.inner
    ]))

;; ============================================
;; ВАРИАНТЫ В CVA (универсальный паттерн)
;; ============================================

;; Все строки внутри variants
(call_expression
  function: (identifier) @_function_name
  (#eq? @_function_name "cva")
  arguments: (arguments
    (object
      (pair
        (property_identifier) @_key
        (#eq? @_key "variants")
        (object
          (pair
            [
              (property_identifier)
              (string (string_fragment))
            ] @_variant_name
            (object
              (pair
                [
                  (property_identifier)
                  (string (string_fragment))
                ] @_value_name
                [
                  (string (string_fragment) @tailwind)
                  (template_string) @tailwind.inner
                ]))))))))

;; ============================================
;; DEFAULTVARIANTS В CVA
;; ============================================

(call_expression
  function: (identifier) @_function_name
  (#eq? @_function_name "cva")
  arguments: (arguments
    (object
      (pair
        (property_identifier) @_key
        (#eq? @_key "defaultVariants")
        (object
          (pair
            [
              (property_identifier)
              (string (string_fragment))
            ] @_variant_name
            (string (string_fragment) @tailwind)))))))
