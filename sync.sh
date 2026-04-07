COMMAND="locize sync --api-key $INPUT_API_KEY --project-id $INPUT_PROJECT_ID --ver $INPUT_VERSION --format $INPUT_FORMAT"

if [ ! -z "$INPUT_PATH" ]; then
  COMMAND="$COMMAND --path $INPUT_PATH"
fi

if [ ! -z "$INPUT_CDN_TYPE" ]; then
  COMMAND="$COMMAND --cdn-type $INPUT_CDN_TYPE"
fi

if [ ! -z "$INPUT_CLEAN" ]; then
  COMMAND="$COMMAND --clean $INPUT_CLEAN"
fi

if [ ! -z "$INPUT_CLEAN_LOCAL_FILES" ]; then
  COMMAND="$COMMAND --clean-local-files $INPUT_CLEAN_LOCAL_FILES"
fi

if [ ! -z "$INPUT_UPDATE_VALUES" ]; then
  COMMAND="$COMMAND --update-values $INPUT_UPDATE_VALUES"
fi

if [ ! -z "$INPUT_AUTO_TRANSLATE" ]; then
  COMMAND="$COMMAND --auto-translate $INPUT_AUTO_TRANSLATE"
fi

if [ ! -z "$INPUT_SKIP_DELETE" ]; then
  COMMAND="$COMMAND --skip-delete $INPUT_SKIP_DELETE"
fi

if [ ! -z "$INPUT_DELETE_REMOTE_NAMESPACE" ]; then
  COMMAND="$COMMAND --delete-remote-namespace $INPUT_DELETE_REMOTE_NAMESPACE"
fi

if [ ! -z "$INPUT_SKIP_EMPTY" ]; then
  COMMAND="$COMMAND --skip-empty $INPUT_SKIP_EMPTY"
fi

if [ ! -z "$INPUT_REFERENCE_LANGUAGE_ONLY" ]; then
  COMMAND="$COMMAND --reference-language-only $INPUT_REFERENCE_LANGUAGE_ONLY"
fi

if [ ! -z "$INPUT_COMPARE_MODIFICATION_TIME" ]; then
  COMMAND="$COMMAND --compare-modification-time $INPUT_COMPARE_MODIFICATION_TIME"
fi

if [ ! -z "$INPUT_LANGUAGE" ]; then
  COMMAND="$COMMAND --language $INPUT_LANGUAGE"
fi

if [ ! -z "$INPUT_LANGUAGES" ]; then
  COMMAND="$COMMAND --languages $INPUT_LANGUAGES"
fi

if [ ! -z "$INPUT_NAMESPACE" ]; then
  COMMAND="$COMMAND --namespace $INPUT_NAMESPACE"
fi

if [ ! -z "$INPUT_LANGUAGE_FOLDER_PREFIX" ]; then
  COMMAND="$COMMAND --language-folder-prefix $INPUT_LANGUAGE_FOLDER_PREFIX"
fi

if [ ! -z "$INPUT_PATH_MASK" ]; then
  COMMAND="$COMMAND --path-mask $INPUT_PATH_MASK"
fi

if [ ! -z "$INPUT_UNPUBLISHED" ]; then
  COMMAND="$COMMAND --unpublished $INPUT_UNPUBLISHED"
fi

if [ ! -z "$INPUT_OVERRIDDEN_ONLY" ]; then
  COMMAND="$COMMAND --overridden-only $INPUT_OVERRIDDEN_ONLY"
fi

if [ ! -z "$INPUT_BRANCH" ]; then
  COMMAND="$COMMAND --branch $INPUT_BRANCH"
fi

if [ ! -z "$INPUT_DRY" ]; then
  COMMAND="$COMMAND --dry $INPUT_DRY"
fi

if [ ! -z "$INPUT_BACKUP_DELETED_PATH" ]; then
  COMMAND="$COMMAND --backup-deleted-path $INPUT_BACKUP_DELETED_PATH"
fi

$COMMAND
