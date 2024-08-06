return {
  {
    "frankroeder/parrot.nvim",
    dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
    -- optionally include "rcarriga/nvim-notify" for beautiful notifications
    config = function()
      require("parrot").setup({
        -- Providers must be explicitly added to make them available.
        providers = {
          ollama = {}, -- provide an empty list to make provider available
        },
        agents = {
          chat = {
            {
              name = "deepseek-coder-v2",
              model = {
                model = "deepseek-coder-v2:latest",
              },
              system_prompt = "You are a versatile AI assistant with capabilities\nextending to general knowledge and coding support. When engaging\nwith users, please adhere to the following guidelines to ensure\nthe highest quality of interaction:\n\n- Admit when unsure by saying 'I don't know.'\n- Ask for clarification when needed.\n- Use first principles thinking to analyze queries.\n- Start with the big picture, then focus on details.\n- Apply the Socratic method to enhance understanding.\n- Include all necessary code in your responses.\n- Stay calm and confident with each task.\n",
              provider = "ollama",
            },
            {
              name = "CodeLlama",
              model = {
                model = "codellama",
                temperature = 1.5,
                top_p = 1,
                num_ctx = 8192,
                min_p = 0.05,
              },
              system_prompt = "You are a versatile AI assistant with capabilities\nextending to general knowledge and coding support. When engaging\nwith users, please adhere to the following guidelines to ensure\nthe highest quality of interaction:\n\n- Admit when unsure by saying 'I don't know.'\n- Ask for clarification when needed.\n- Use first principles thinking to analyze queries.\n- Start with the big picture, then focus on details.\n- Apply the Socratic method to enhance understanding.\n- Include all necessary code in your responses.\n- Stay calm and confident with each task.\n",
              provider = "ollama",
            },
          },
          command = {
            {
              name = "deepseek-coder-v2",
              model = {
                model = "deepseek-coder-v2:latest",
              },
              system_prompt = "You are a versatile AI assistant with capabilities\nextending to general knowledge and coding support. When engaging\nwith users, please adhere to the following guidelines to ensure\nthe highest quality of interaction:\n\n- Admit when unsure by saying 'I don't know.'\n- Ask for clarification when needed.\n- Use first principles thinking to analyze queries.\n- Start with the big picture, then focus on details.\n- Apply the Socratic method to enhance understanding.\n- Include all necessary code in your responses.\n- Stay calm and confident with each task.\n",
              provider = "ollama",
            },
          },
        },
        hooks = {
          Complete = function(prt, params)
            local template = [[
        I have the following code from {{filename}}:

        ```{{filetype}}
        {{selection}}
        ```

        Please finish the code above carefully and logically.
        Respond just with the snippet of code that should be inserted."
        ]]
            local agent = prt.get_command_agent()
            prt.Prompt(params, prt.ui.Target.append, agent, nil, template)
          end,
          CompleteFullContext = function(prt, params)
            local template = [[
        I have the following code from {{filename}}:

        ```{{filetype}}
        {filecontent}}
        ```

        Please look at the following section specifically:
        ```{{filetype}}
        {{selection}}
        ```

        Please finish the code above carefully and logically.
        Respond just with the snippet of code that should be inserted."
        ]]
            local agent = prt.get_command_agent()
            prt.Prompt(params, prt.ui.Target.append, agent, nil, template)
          end,
          CompleteMultiContext = function(prt, params)
            local template = [[
        I have the following code from {{filename}} and other realted files:

        ```{{filetype}}
        {{multifilecontent}}
        ```

        Please look at the following section specifically:
        ```{{filetype}}
        {{selection}}
        ```

        Please finish the code above carefully and logically.
        Respond just with the snippet of code that should be inserted."
        ]]
            local agent = prt.get_command_agent()
            prt.Prompt(params, prt.ui.Target.append, agent, nil, template)
          end,
          Explain = function(prt, params)
            local template = [[
        Your task is to take the code snippet from {{filename}} and explain it with gradually increasing complexity.
        Break down the code's functionality, purpose, and key components.
        The goal is to help the reader understand what the code does and how it works.

        ```{{filetype}}
        {{selection}}
        ```

        Use the markdown format with codeblocks and inline code.
        Explanation of the code above:
        ]]
            local agent = prt.get_chat_agent()
            prt.logger.info("Explaining selection with agent: " .. agent.name)
            prt.Prompt(params, prt.ui.Target.new, agent, nil, template)
          end,
          FixBugs = function(prt, params)
            local template = [[
        You are an expert in {{filetype}}.
        Fix bugs in the below code from {{filename}} carefully and logically:
        Your task is to analyze the provided {{filetype}} code snippet, identify
        any bugs or errors present, and provide a corrected version of the code
        that resolves these issues. Explain the problems you found in the
        original code and how your fixes address them. The corrected code should
        be functional, efficient, and adhere to best practices in
        {{filetype}} programming.

        ```{{filetype}}
        {{selection}}
        ```

        Fixed code:
        ]]
            local agent = prt.get_command_agent()
            prt.logger.info("Fixing bugs in selection with agent: " .. agent.name)
            prt.Prompt(params, prt.ui.Target.new, agent, nil, template)
          end,
          Optimize = function(prt, params)
            local template = [[
        You are an expert in {{filetype}}.
        Your task is to analyze the provided {{filetype}} code snippet and
        suggest improvements to optimize its performance. Identify areas
        where the code can be made more efficient, faster, or less
        resource-intensive. Provide specific suggestions for optimization,
        along with explanations of how these changes can enhance the code's
        performance. The optimized code should maintain the same functionality
        as the original code while demonstrating improved efficiency.

        ```{{filetype}}
        {{selection}}
        ```

        Optimized code:
        ]]
            local agent = prt.get_command_agent()
            prt.logger.info("Optimizing selection with agent: " .. agent.name)
            prt.Prompt(params, prt.ui.Target.new, agent, nil, template)
          end,
          UnitTests = function(prt, params)
            local template = [[
        I have the following code from {{filename}}:

        ```{{filetype}}
        {{selection}}
        ```

        Please respond by writing table driven unit tests for the code above.
        ]]
            local agent = prt.get_command_agent()
            prt.logger.info("Creating unit tests for selection with agent: " .. agent.name)
            prt.Prompt(params, prt.ui.Target.enew, agent, nil, template)
          end,
          Debug = function(prt, params)
            local template = [[
        I want you to act as {{filetype}} expert.
        Review the following code, carefully examine it, and report potential
        bugs and edge cases alongside solutions to resolve them.
        Keep your explanation short and to the point:

        ```{{filetype}}
        {{selection}}
        ```
        ]]
            local agent = prt.get_chat_agent()
            prt.logger.info("Debugging selection with agent: " .. agent.name)
            prt.Prompt(params, prt.ui.Target.enew, agent, nil, template)
          end,
          CommitMsg = function(prt, params)
            local futils = require("parrot.file_utils")
            if futils.find_git_root() == "" then
              prt.logger.warning("Not in a git repository")
              return
            else
              local template = [[
          I want you to act as a commit message generator. I will provide you
          with information about the task and the prefix for the task code, and
          I would like you to generate an appropriate commit message using the
          conventional commit format. Do not write any explanations or other
          words, just reply with the commit message.
          Start with a short headline as summary but then list the individual
          changes in more detail.

          Here are the changes that should be considered by this message:
          ]] .. vim.fn.system("git diff --no-color --no-ext-diff --staged")
              local agent = prt.get_command_agent()
              prt.Prompt(params, prt.ui.Target.append, agent, nil, template)
            end
          end,
          SpellCheck = function(prt, params)
            local chat_prompt = [[
        Your task is to take the text provided and rewrite it into a clear,
        grammatically correct version while preserving the original meaning
        as closely as possible. Correct any spelling mistakes, punctuation
        errors, verb tense issues, word choice problems, and other
        grammatical mistakes.
        ]]
            prt.ChatNew(params, chat_prompt)
          end,
          CodeConsultant = function(prt, params)
            local chat_prompt = [[
          Your task is to analyze the provided {{filetype}} code and suggest
          improvements to optimize its performance. Identify areas where the
          code can be made more efficient, faster, or less resource-intensive.
          Provide specific suggestions for optimization, along with explanations
          of how these changes can enhance the code's performance. The optimized
          code should maintain the same functionality as the original code while
          demonstrating improved efficiency.

          Here is the code
          ```{{filetype}}
          {{filecontent}}
          ```
        ]]
            prt.ChatNew(params, chat_prompt)
          end,
          ProofReader = function(prt, params)
            local chat_prompt = [[
        I want you to act as a proofreader. I will provide you with texts and
        I would like you to review them for any spelling, grammar, or
        punctuation errors. Once you have finished reviewing the text,
        provide me with any necessary corrections or suggestions to improve the
        text. Highlight the corrected fragments (if any) using markdown backticks.

        When you have done that subsequently provide me with a slightly better
        version of the text, but keep close to the original text.

        Finally provide me with an ideal version of the text.

        Whenever I provide you with text, you reply in this format directly:

        ## Corrected text:

        {corrected text, or say "NO_CORRECTIONS_NEEDED" instead if there are no corrections made}

        ## Slightly better text

        {slightly better text}

        ## Ideal text

        {ideal text}
        ]]
            prt.ChatNew(params, chat_prompt)
          end,
        },
      })
    end,
  },
}
