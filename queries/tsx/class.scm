;; ============================================
;; ОРИГИНАЛЬНЫЕ ПАТТЕРНЫ ДЛЯ JSX АТРИБУТОВ
;; ============================================

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
;; ПАТТЕРНЫ ДЛЯ CVA()
;; ============================================

;; 1. Базовая строка cva()
(call_expression
  function: (identifier) @_function_name
  (#eq? @_function_name "cva")
  arguments: (arguments
    (string (string_fragment) @tailwind)))

;; 2. Шаблонный литерал в cva()
(call_expression
  function: (identifier) @_function_name
  (#eq? @_function_name "cva")
  arguments: (arguments
    (template_string) @tailwind.inner))

;; 3. Строки внутри объекта (variants)
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
            (property_identifier) @_variant_name
            (object
              (pair
                (property_identifier) @_value_name
                (string (string_fragment) @tailwind)))))))))

;; 4. Строки внутри defaultVariants
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
            (property_identifier) @_variant_name
            (string (string_fragment) @tailwind)))))))

;; 5. Шаблонные литералы внутри вариантов
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
            (property_identifier) @_variant_name
            (object
              (pair
                (property_identifier) @_value_name
                (template_string) @tailwind.inner))))))))

;; ============================================
;; ПАТТЕРНЫ ДЛЯ ДРУГИХ ФУНКЦИЙ
;; ============================================

;; Для cn()
(call_expression
  function: (identifier) @_function_name
  (#eq? @_function_name "cn")
  arguments: (arguments
    (string (string_fragment) @tailwind)))

;; Для clsx()
(call_expression
  function: (identifier) @_function_name
  (#eq? @_function_name "clsx")
  arguments: (arguments
    (string (string_fragment) @tailwind)))

;; Для twMerge()
(call_expression
  function: (identifier) @_function_name
  (#eq? @_function_name "twMerge")
  arguments: (arguments
    (string (string_fragment) @tailwind)))
