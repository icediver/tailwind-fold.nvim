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
;; ПАТТЕРНЫ ДЛЯ CVA() - БАЗОВАЯ СТРОКА
;; ============================================

;; 1. Обычная строка
(call_expression
  function: (identifier) @_function_name
  (#eq? @_function_name "cva")
  arguments: (arguments
    (string (string_fragment) @tailwind)))

;; 2. Шаблонный литерал
(call_expression
  function: (identifier) @_function_name
  (#eq? @_function_name "cva")
  arguments: (arguments
    (template_string) @tailwind.inner))

;; ============================================
;; ПАТТЕРНЫ ДЛЯ ВАРИАНТОВ (С ПОДДЕРЖКОЙ КАВЫЧЕК)
;; ============================================

;; 1. Варианты с обычными ключами
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

;; 2. Варианты с ключами в кавычках
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
            (string (string_fragment)) @_variant_name
            (object
              (pair
                (property_identifier) @_value_name
                (string (string_fragment) @tailwind)))))))))

;; 3. Варианты с ключами в кавычках и значениями в кавычках
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
            (string (string_fragment)) @_variant_name
            (object
              (pair
                (string (string_fragment)) @_value_name
                (string (string_fragment) @tailwind)))))))))

;; 4. Универсальный паттерн для вариантов (любые ключи)
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
                (string (string_fragment) @tailwind)))))))))

;; 5. Шаблонные литералы в вариантах
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
                (template_string) @tailwind.inner))))))))

;; ============================================
;; ПАТТЕРНЫ ДЛЯ DEFAULTVARIANTS
;; ============================================

;; 1. Обычные ключи
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

;; 2. Ключи в кавычках
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
            (string (string_fragment)) @_variant_name
            (string (string_fragment) @tailwind)))))))

;; 3. Универсальный паттерн
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
