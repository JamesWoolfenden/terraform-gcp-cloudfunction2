# Invoked

```bash
curl -m 70 -X POST https://us-central1-pangpt.cloudfunctions.net/btdelete \
-H "Authorization: bearer $(gcloud auth print-identity-token)" \
-H "Content-Type: application/json" \
-d '{
"name": "James"
}'
```
