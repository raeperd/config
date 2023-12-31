#!/usr/bin/env ruby

# You can generate json by executing the following command on Terminal.
#
# $ ruby ./CreateLauncherModeTemplate.json.rb
#

# Parameters

def parameters
  {
    :simultaneous_threshold_milliseconds => 500,
    :trigger_key => 'o',
  }
end

############################################################

require 'json'

def main
  version = "v1.0.4"

  rule = {
    'description' => 'O-Launcher Rule ' + version,
    'manipulators' => [
      generate_launcher_mode('a', [], [{ 'shell_command' => "open -a Arc.app" }]),
      generate_launcher_mode('b', [], [{ 'shell_command' => "open -a Obsidian.app" }]),
      generate_launcher_mode('c', [], [{ 'shell_command' => "open -a 'Google Chrome.app'" }]),
      generate_launcher_mode('f', [], [{ 'shell_command' => "open -a Figma.app" }]),
      generate_launcher_mode('i', [], [{ 'shell_command' => "open -a iTerm.app" }]),
      generate_launcher_mode('j', [], [{ 'shell_command' => "open -a 'IntelliJ IDEA.app'" }]),
      generate_launcher_mode('k', [], [{ 'shell_command' => "open -a KakaoTalk.app" }]),
      generate_launcher_mode('m', [], [{ 'shell_command' => "open -a Mail.app" }]),
      generate_launcher_mode('n', [], [{ 'shell_command' => "open -a Notion.app" }]),
      generate_launcher_mode('p', [], [{ 'shell_command' => "open -a Postman.app" }]),
      generate_launcher_mode('r', [], [{ 'shell_command' => "open -a ResponsivelyApp.app" }]),
      generate_launcher_mode('s', [], [{ 'shell_command' => "open -a Safari.app" }]),
      generate_launcher_mode('t', [], [{ 'shell_command' => "open -a Todoist.app" }]),
      generate_launcher_mode('v', [], [{ 'shell_command' => "open -a 'Visual Studio Code.app'" }]),
      generate_launcher_mode('w', [], [{ 'shell_command' => "open -a 'KakaoWork.app'" }]),
    ].flatten,
  }

  withMetadata = {
    "title" => "O-Launcher Rule " + version,
    "maintainers" => ["raeperd"],
    "homepage" => ["https://raeperd.github.io"].flatten,
    "rules" => [rule].flatten,
  }

  puts JSON.pretty_generate(withMetadata)
end

def generate_launcher_mode(from_key_code, mandatory_modifiers, to)
  data = []

  ############################################################

  h = {
    'type' => 'basic',
    'from' => {
      'key_code' => from_key_code,
      'modifiers' => {
        'mandatory' => mandatory_modifiers,
        'optional' => [
          'any',
        ],
      },
    },
    'to' => to,
    'conditions' => [
      {
        'type' => 'variable_if',
        'name' => 'launcher_mode',
        'value' => 1,
      },
    ],
  }

  data << h

  ############################################################

  h = {
    'type' => 'basic',
    'from' => {
      'simultaneous' => [
        {
          'key_code' => parameters[:trigger_key],
        },
        {
          'key_code' => from_key_code,
        },
      ],
      'simultaneous_options' => {
        'key_down_order' => 'strict',
        'key_up_order' => 'strict_inverse',
        'to_after_key_up' => [
          {
            'set_variable' => {
              'name' => 'launcher_mode',
              'value' => 0,
            },
          },
        ],
      },
      'modifiers' => {
        'mandatory' => mandatory_modifiers,
        'optional' => [
          'any',
        ],
      },
    },
    'to' => [
      {
        'set_variable' => {
          'name' => 'launcher_mode',
          'value' => 1,
        },
      },
    ].concat(to),
    'parameters' => {
      'basic.simultaneous_threshold_milliseconds' => parameters[:simultaneous_threshold_milliseconds],
    },
  }

  data << h

  ############################################################

  data
end

main
