; locals.scm

; Scopes
;-------

(entity_definition) @scope


; Definitions
;------------

(parameter_definition
  (name) @definition.var)

(artifact_import
  alias: (_) @definition.import)

; References
;------------

(identifier) @reference
