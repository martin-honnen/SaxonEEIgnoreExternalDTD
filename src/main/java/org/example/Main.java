package org.example;

import com.saxonica.config.EnterpriseConfiguration;
import com.saxonica.config.StreamingTransformerFactory;
import net.sf.saxon.lib.Feature;

import javax.xml.transform.Templates;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class Main {
    public static void main(String[] args) throws TransformerException {

        EnterpriseConfiguration configuration = new EnterpriseConfiguration();
        configuration.setConfigurationProperty(Feature.DTD_VALIDATION, false);
        configuration.setValidation(false);

        configuration.setParseOptions(configuration.getParseOptions().withParserFeature("http://apache.org/xml/features/nonvalidating/load-external-dtd", false));

        StreamingTransformerFactory streamingTransformerFactory = new StreamingTransformerFactory(configuration);

        Templates streamingTemplates = streamingTransformerFactory.newTemplates(new StreamSource("xslt-test1.xsl"));

        streamingTemplates.newTransformer().transform(new StreamSource("input1.xml"), new StreamResult("result1.xml"));

        streamingTemplates.newTransformer().transform(new StreamSource("input2.xml"), new StreamResult("result2.xml"));

        streamingTemplates.newTransformer().transform(new StreamSource("input3.xml"), new StreamResult("result3.xml"));

    }
}