# Set your OpenAI API key
$env:OPENAI_API_KEY = "API-KEY"

# Set the model to use (e.g. "text-davinci-003")
$MODEL = "text-davinci-003"

# Set the prompt to use as input for the GPT-3 model
$PROMPT = $args[0]

# Set the number of tokens to generate
$TOKEN_COUNT = 300

# Set the temperature
$TEMPERATURE = 0.4

# Set the top_p value
$TOP_P = 1

# Set the frequency
$FREQUENCY = 0.5

# Set the presence
$PRESENCE = 0.5

# Generate text using the GPT-3 model
$BODY = @{
    "model" = $MODEL
    "prompt" = $PROMPT
    "temperature" = $TEMPERATURE
    "top_p" = $TOP_P
    "frequency_penalty" = $FREQUENCY
    "presence_penalty" = $PRESENCE
    "max_tokens" = $TOKEN_COUNT
}
$OUTPUT = Invoke-WebRequest -Method Post -Headers @{Authorization = "Bearer $env:OPENAI_API_KEY"} -ContentType "application/json" -Body (ConvertTo-Json $BODY) -Uri "https://api.openai.com/v1/completions"

# Extract the text from the response
$OUTPUT = $OUTPUT.Content | ConvertFrom-Json | Select-Object -ExpandProperty choices | Select-Object -ExpandProperty text

# Print the output
Write-Output $OUTPUT
