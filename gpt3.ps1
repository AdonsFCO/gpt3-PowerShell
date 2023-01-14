# Set your OpenAI API key
$env:OPENAI_API_KEY = "API-KEY"

# Set the model to use (e.g. "text-davinci-003")
$MODEL = "text-davinci-003"

$PROMPT = $args[0]
$TOKEN_COUNT = 300
$TEMPERATURE = 0.4
$TOP_P = 1
$FREQUENCY = 0.5


$PRESENCE = 0.5

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
$OUTPUT = $OUTPUT.Content | ConvertFrom-Json | Select-Object -ExpandProperty choices | Select-Object -ExpandProperty text
Write-Output $OUTPUT
