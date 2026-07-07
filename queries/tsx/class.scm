(jsx_attribute
  (property_identifier) @_attribute_name
  (#any-of? @_attribute_name "class" "className" "style" "css" "tw")
  [
    (string
      (string_fragment) @tailwind)
    (jsx_expression
      (template_string) @tailwind.inner)
  ])

;; ============================================
;; ДОБАВЛЯЕМ ПОДДЕРЖКУ CVA И ДРУГИХ ФУНКЦИЙ
;; ============================================

;; Для cva() с обычной строкой
(call_expression
  function: (identifier) @_function_name
  (#eq? @_function_name "cva")
  arguments: (arguments
    (string (string_fragment) @tailwind)
  ))

;; Для cva() с шаблонным литералом
(call_expression
  function: (identifier) @_function_name
  (#eq? @_function_name "cva")
  arguments: (arguments
    (template_string) @tailwind.inner
  ))

;; Для cn() (classnames)
(call_expression
  function: (identifier) @_function_name
  (#eq? @_function_name "cn")
  arguments: (arguments
    (string (string_fragment) @tailwind)
  ))

;; Для clsx()
(call_expression
  function: (identifier) @_function_name
  (#eq? @_function_name "clsx")
  arguments: (arguments
    (string (string_fragment) @tailwind)
  ))

;; Для twMerge()
(call_expression
  function: (identifier) @_function_name
  (#eq? @_function_name "twMerge")
  arguments: (arguments
    (string (string_fragment) @tailwind)
  ))

;; Для вариантов внутри объекта (cva({ variants: ... }))
(call_expression
  function: (identifier) @_function_name
  (#eq? @_function_name "cva")
  arguments: (arguments
    (object
      (pair
        (property_identifier) @_key
        (#any-of? @_key "variants" "defaultVariants")
        (object
          (pair
            (property_identifier) @_variant
            (object
              (pair
                (property_identifier) @_size
                (string (string_fragment) @tailwind))))))))
