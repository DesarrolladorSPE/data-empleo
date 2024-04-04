import "./styles.css";

const ButtonCard = ({children, className="button-card-container", title="", onClick, type="button"}) => {
    return(
        <button
            className={className}
            title={title}
            onClick={(event) => onClick(event)}
            type={type}
        >
            {children}
        </button>
    );
}

export { ButtonCard };