/**
 * 
 */
package com.avibha.common.utility;

import java.util.Comparator;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author Maimur
 *
 */
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@ToString
public class LabelValueBean {
	private @Getter @Setter String label = null;
	private@Getter @Setter String value = null;
	
	/**
     * Comparator that can be used for a case insensitive sort of 
     * <code>LabelValueBean</code> objects.
     */
    public static final Comparator CASE_INSENSITIVE_ORDER = new Comparator() {
    	public int compare(Object o1, Object o2) {
    		String label1 = ((LabelValueBean) o1).getLabel();
    		String label2 = ((LabelValueBean) o2).getLabel();
    		return label1.compareToIgnoreCase(label2);
    	}
    };
    /**
	 * Compare LabelValueBeans based on the label, because that's the human 
     * viewable part of the object.
	 * @see Comparable
	 */
	public int compareTo(Object o) {
		// Implicitly tests for the correct type, throwing 
        // ClassCastException as required by interface
		String otherLabel = ((LabelValueBean) o).getLabel();

		return this.getLabel().compareTo(otherLabel);
	}
}

