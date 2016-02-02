#   (c) Copyright 2014 Hewlett-Packard Development Company, L.P.
#   All rights reserved. This program and the accompanying materials
#   are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
#   The Apache License is available at
#   http://www.apache.org/licenses/LICENSE-2.0
#
####################################################
# Copies YAML configuration files to the system properties folder.
#
# Inputs:
#   - source_dir - path of source directory
#   - target_dir - path of target directory
####################################################

namespace: io.cloudslang.operations_orchestration.createCP

operation:
  name: copy_config_items
  inputs:
    - source_dir
    - target_dir
  action:
    python_script: |
          import shutil
          import os
          for subdir, dirs, files in os.walk(source_dir):
              for file in files:
                  filepath = subdir + os.sep + file

                  if filepath.endswith(".yaml"):
                      shutil.move(filepath, target_dir+file)
  results:
    - SUCCESS
