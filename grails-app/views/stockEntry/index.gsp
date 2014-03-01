<html>
<body>

<g:each in="${entryList }" var="entry">
	${entry.share} - ${entry.timestamp } - ${entry.value }<br />
</g:each>

</body>

</html>