# build GraphQL schema completion file from introspection output
function bgsc() {
rg '[^"][A-Za-z]{2,}[:(]' gql-schema.graphql |
	cut -d : -f 1 |
	awk -F\( '{print $1}' |
	cut -d \" -f 1 |
	awk 'NF > 0' |
	awk '{ sub(/^[ \t]+/, ""); print }' |
	sort -u |
	cut -d' ' -f1 | > gql-comp-src.text
}
